import express from "express";

import {
  chat,
  getConversationHistory,
  clearConversationHistory,
} from "../controllers/openAI.controller.js";

import {
  authenticate,
  authorize,
} from "../middlewares/authentication.middlewares.js";

const router = express.Router();
router.route("/").get(authenticate, getConversationHistory);
router.route("/message").post(authenticate, chat);
router.route("/clear").delete(clearConversationHistory);

export default router;
