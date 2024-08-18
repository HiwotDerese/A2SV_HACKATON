// helpers/nlp.js

import { Equipment } from "../models/index.js"; // Ensure Equipment model is imported
import { Op } from "sequelize"; // Import Sequelize operators

// Function to retrieve available equipment names from the database
const fetchAvailableEquipmentNames = async () => {
  const equipment = await Equipment.findAll({
    where: {
      isBooked: false,
    },
    attributes: ["name"],
  });

  return equipment.map((eq) => eq.name.toLowerCase());
};

// Function to extract requested equipment from user's message
const extractEquipmentName = async (message) => {
  // Normalize message to lowercase for easier matching
  const lowerCaseMessage = message.toLowerCase();

  // Get the current list of available equipment names
  const equipmentList = await fetchAvailableEquipmentNames();

  // Find the first equipment name mentioned in the message
  for (const equipment of equipmentList) {
    if (lowerCaseMessage.includes(equipment)) {
      return equipment;
    }
  }

  return null; // Return null if no equipment name is found
};

export { extractEquipmentName };
