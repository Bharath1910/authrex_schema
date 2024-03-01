import type { ColumnType } from "kysely";
export type Generated<T> = T extends ColumnType<infer S, infer I, infer U>
  ? ColumnType<S, I | undefined, U>
  : ColumnType<T, T | undefined, T>;
export type Timestamp = ColumnType<Date, Date | string, Date | string>;

export const Methods = {
    USERNAME_PASSWORD: "USERNAME_PASSWORD",
    PGP: "PGP"
} as const;
export type Methods = (typeof Methods)[keyof typeof Methods];
export type App = {
    id: string;
    user_id: string;
    api_key: string;
    redirect_url: string;
    methods: Methods;
};
export type Owner = {
    id: string;
    username: string;
    password: string;
    pgp_key: string | null;
};
export type User = {
    id: string;
    username: string;
    password: string;
    pgp_key: string | null;
    app_id: string;
};
export type DB = {
    App: App;
    Owner: Owner;
    User: User;
};
