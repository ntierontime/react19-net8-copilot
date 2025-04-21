import { defineConfig } from 'vite';
import plugin from '@vitejs/plugin-react';

// https://vitejs.dev/config/
export default defineConfig({
    plugins: [plugin()],
    server: {
        host: true,
        port: 3333,
        watch: {
            usePolling: true,
            interval: 1000,        }
    }
})
