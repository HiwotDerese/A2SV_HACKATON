import("sequelize-cli").Migration;

export default {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable("openai", {
      id: {
        allowNull: false,
        primaryKey: true,
        type: Sequelize.UUID,
        defaultValue: Sequelize.UUIDV4,
      },
      message: {
        type: Sequelize.TEXT,
        allowNull: false,
      },
      role: {
        type: Sequelize.ENUM("system", "assistant", "user"),
        allowNull: false,
        defaultValue: "system",
      },
      userId: {
        type: Sequelize.UUID,
        references: {
          model: "users",
          key: "id",
        },
        onDelete: "CASCADE",
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE,
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE,
      },
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable("openai");
  },
};
