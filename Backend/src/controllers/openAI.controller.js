// controller.js

import openaiChat from "../services/openAI.service.js";
import { User, OpenAI, Equipment } from "../models/index.js"; // Ensure Equipment model is imported
import { extractEquipmentName } from "../utils/nlp.utils.js"; // Import extractEquipmentName function
import { Op } from "sequelize"; // Import Op from Sequelize

const initialMessage = {
  role: "system",
  content:
    "You are Dozer, a construction equipment suggestion assistant. Your tasks are to guide users on selecting the right construction equipment for their projects based on their descriptions, provide a list of available equipment for rent in the app, assist users in creating or finding bids for equipment, and ensure users can navigate to the relevant posts. Additionally, you should cater to returning users and comply with potential legal requirements.",
};

// Function to check equipment availability
const checkEquipmentAvailability = async (equipmentName) => {
  const equipment = await Equipment.findAll({
    where: {
      name: {
        [Op.iLike]: `%${equipmentName}%`, // Case-insensitive match
      },
      isBooked: false,
    },
  });

  return equipment.map((eq) => eq.name);
};

// Handle the conversation between the user and the assistant
export const chat = async (req, res) => {
  try {
    const { message } = req.body;
    const user = req.user;

    if (!user) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    // Retrieve the existing conversation history from the database
    const history = await OpenAI.findAll({
      where: {
        userId: user.id,
      },
      order: [["createdAt", "ASC"]],
    });

    // Create conversation history array for the OpenAI API
    const conversationHistory = history.map((entry) => ({
      role: entry.role,
      content: entry.message,
    }));

    // Add initial message if the history is empty
    if (conversationHistory.length === 0) {
      conversationHistory.push(initialMessage);
    }

    // Add the user's new message to the conversation history
    conversationHistory.push({
      role: "user",
      content: message,
    });

    // Extract the requested equipment name from the user's message
    const requestedEquipmentName = await extractEquipmentName(message);

    let equipmentResponse = "";

    if (requestedEquipmentName) {
      // Check for availability of the extracted equipment name
      const requestedEquipment = await checkEquipmentAvailability(
        requestedEquipmentName
      );

      if (requestedEquipment.length > 0) {
        equipmentResponse = `We have the following equipment available for rent: ${requestedEquipment.join(
          ", "
        )}.`;
      } else {
        equipmentResponse = `Currently, we don't have ${requestedEquipmentName} available for rent.`;
      }
    } else {
      equipmentResponse =
        "Could you please specify the equipment you're interested in?";
    }

    // Add the assistant's response with equipment information to the conversation history
    conversationHistory.push({
      role: "assistant",
      content: equipmentResponse,
    });

    // Get the assistant's response from OpenAI
    const aiResponse = await openaiChat(conversationHistory);

    // Save the user's message to the database
    await OpenAI.create({
      role: "user",
      message,
      userId: user.id,
    });

    // Save the assistant's AI response to the database
    await OpenAI.create({
      role: "assistant",
      message: aiResponse,
      userId: user.id,
    });

    // Send response to the user
    res.json({ response: `${equipmentResponse} ${aiResponse}` });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Get the conversation history
export const getConversationHistory = async (req, res) => {
  try {
    const user = req.user;

    if (!user) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    const conversationHistory = await OpenAI.findAll({
      where: {
        userId: user.id,
      },
    });

    res.json({ conversationHistory });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
};

// Clear the conversation history
export const clearConversationHistory = async (req, res) => {
  try {
    const user = req.user;

    if (!user) {
      return res.status(401).json({ error: "Unauthorized" });
    }

    await OpenAI.destroy({
      where: {
        userId: user.id,
      },
    });

    res.json({ message: "Conversation history cleared" });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal server error" });
  }
};
