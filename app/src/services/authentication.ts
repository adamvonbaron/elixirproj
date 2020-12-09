export const storeUser = (userHash: Record<string, string>): void => {
  localStorage.setItem("user", JSON.stringify(userHash));
};

export const getUser = (): Record<string, string> | null => {
  const user = localStorage.getItem("user");
  if (user) return JSON.parse(user);
  return null;
};

export const deleteUser = (): void => {
  localStorage.removeItem("user");
};
