import { Model } from "sequelize";

export default (sequelize, DataTypes) => {
  class OpenAI extends Model {
    static associate(models) {
      OpenAI.belongsTo(models.User, {
        foreignKey: "userId",
        onDelete: "CASCADE",
      });
    }
  }

  OpenAI.init(
    {
      id: {
        type: DataTypes.UUID,
        defaultValue: DataTypes.UUIDV4,
        primaryKey: true,
        allowNull: false,
      },
      role: {
        type: DataTypes.ENUM("system", "assistant", "user"),
        allowNull: false,
        defaultValue: "system",
      },
      message: {
        type: DataTypes.TEXT,
        allowNull: false,
      },
      userId: {
        type: DataTypes.UUID,
        references: {
          model: "users",
          key: "id",
        },
        onDelete: "CASCADE",
      },
    },

    {
      sequelize,
      modelName: "OpenAI",
      tableName: "openai",
    }
  );
  return OpenAI;
};
