// openAI.service.js

import OpenAI from "openai";
import dotenv from "dotenv";

dotenv.config();

const openai = new OpenAI({
  apiKey: process.env.OPENAI_API_KEY,
});

const openaiChat = async (conversationHistory) => {
  try {
    const response = await openai.chat.completions.create({
      model: "gpt-4",
      messages: conversationHistory, // This should be an array of objects
    });

    return response.choices[0].message.content;
  } catch (error) {
    console.error("Error generating chat response:", error);
    throw new Error("Error generating chat response");
  }
};

export default openaiChat;
