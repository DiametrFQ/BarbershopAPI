import { createContext } from "react";

export interface ISet{
    id: number;
    setId: (newRole: number) => void;
    role: string;
    setRole: (newRole: string) => void;
}

export const Context = createContext<ISet|null>(null)