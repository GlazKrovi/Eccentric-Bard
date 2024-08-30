import { createContextId, useContextProvider } from "@builder.io/qwik";

interface UserPreferencesType {}

export const UserPreferences =
  createContextId<UserPreferencesType>("user.preferences");

useContextProvider(UserPreferences, null);
