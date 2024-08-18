# Construction Equipment Rental App

## Overview

This application is a comprehensive platform designed to connect contractors and individuals with reliable construction equipment suppliers. The app leverages AI to provide personalized recommendations, streamlining the rental process and enhancing user experience.

## Key Features

1. **AI-Enhanced Recommendations**:
   - **OpenAI Chatbot**: Users can interact with the chatbot by describing their construction projects, and the AI provides suggestions for the necessary equipment.
   - **Personal Recommendations**: The AI model uses popular choices and the user's booking history to suggest equipment that best suits their needs.

2. **Equipment Listings**:
   - **Upload Equipment**: Equipment owners can upload their machinery and tools, making them available for rent.
   - **Search and Booking**: Users can search for available equipment and book them directly through the app.

3. **Live Bidding**:
   - **Create Bids**: Users can initiate live bidding sessions where equipment owners participate, offering competitive rental rates.

## AI Models and Their Roles

- **OpenAI GPT-4**: 
  - **Chatbot Interaction**: The GPT-4 model is utilized to interpret user queries related to their construction projects and provide equipment suggestions.
  - **Personalization**: The model analyzes user interaction data, such as booking history and popular choices among similar users, to offer tailored equipment recommendations.

## Project Structure

```plaintext
├── /backend/              # Django-based backend services
│   ├── /api/              # REST API for user and equipment management
│   ├── /models/           # Django models for users, equipment, etc.
│   ├── /chatbot/          # Integration with OpenAI GPT-4 for recommendations
│   └── /migrations/       # Database migrations
├── /frontend/             # Flutter-based frontend application
│   ├── /screens/          # UI screens and components
│   ├── /services/         # API service integration
│   └── /models/           # Data models for frontend
└── README.md              # Project documentation
```

## Setup Instructions

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/HiwotDerese/A2SV_HACKATON.git
   cd https://github.com/HiwotDerese/A2SV_HACKATON.git
   ```

2. **Build and Run the Application**:
   ```bash
   flutter run / npm run dev
   ```

3. **Access the Application**:
   - **Frontend**: Open your browser and navigate to `http://localhost:8000`.
   - **Backend**: The backend services will be accessible on `http://localhost:8000/api`.

4. **Configure pgAdmin (Optional)**:
   - If you want to manage the PostgreSQL database using pgAdmin, refer to the pgAdmin setup instructions in the main repository.

## Contributing

We welcome contributions! Please submit your pull requests, and make sure to follow the contribution guidelines outlined in the `CONTRIBUTING.md` file.

---

