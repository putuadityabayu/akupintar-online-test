import { sequelize } from "../src/models/helper";
import modelInitialization from "../src/models/index";

export async function beforeTest() {
    await modelInitialization();
}

export async function afterTest() {
    await sequelize.close();
}

declare global {
    var jwtToken: string|undefined
}