interface AppConfig {
    routeBaseName: string | undefined;
    greeting: string | undefined;
}

declare namespace NodeJS {
    export interface ProcessEnv {
        REACT_APP_ROUTE_BASE: string | undefined;
        REACT_APP_GREETING: string | undefined;
    }
}