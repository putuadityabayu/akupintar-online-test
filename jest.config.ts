import type {Config} from '@jest/types';
// Sync object
const config: Config.InitialOptions = {
  verbose: true,
  transform: {
    "^.+\\.tsx?$": "ts-jest",
  },
  "testPathIgnorePatterns": [
    "/node_modules/",
    "/sql/"
  ],
  testEnvironment: "node"
};
export default config;