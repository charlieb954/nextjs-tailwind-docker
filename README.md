# Create a NextJS App with Tailwind Deployed Using Docker

This guide will help you create a NextJS application with Tailwind CSS and deploy it using Docker.

## Prerequisites

- Node.js and npm installed
- Docker installed

## Create a NextJS App with Tailwind Installed

Follow the steps below to create a NextJS application with Tailwind CSS:

1. Create a new NextJS application with TypeScript and ESLint:

    ```bash
    npx create-next-app@latest nextjs-tailwind-example --typescript --eslint
    # Answer the prompts:
    # Y tailwind, Y src/ directory, Y app router, Y Turbopack, N customize import alias
    ```

2. Navigate to the project directory:

    ```bash
    cd nextjs-tailwind-example
    ```

3. Install Tailwind CSS, PostCSS, and Autoprefixer as development dependencies:

    ```bash
    npm install -D tailwindcss postcss autoprefixer
    ```

4. Initialise Tailwind CSS configuration:

    ```bash
    npx tailwindcss init -p
    ```

5. Update the `tailwind.config.js` file to include the correct content paths:

    ```javascript
    // tailwind.config.js
    module.exports = {
      content: ["./src/**/*.{js,ts,jsx,tsx,mdx}"],
      theme: {
        extend: {},
      },
      plugins: [],
    }
    ```

6. Update the `src/app/page.tsx` file to include a sample Tailwind CSS component:

    ```javascript
    // src/app/page.tsx
    export default function Home() {
      return (
        <h1 className="text-3xl font-bold underline">
          Hello world!
        </h1>
      )
    }
    ```

7. Run the development server to verify the setup:

    ```bash
    npm run dev
    ```

## Run Using Docker

The Dockerfile in this repository uses a multistage build to reduce the size of the container by around 20%.
Follow the steps below to build and run the Docker container:

1. Build the Docker image:

    ```bash
    docker build -t nextjs-tailwind-example .
    ```

2. Run the Docker container:

    ```bash
    docker run -p 3000:3000 nextjs-tailwind-example
    ```

This will start the application on port 3000.

## Additional Resources

For more information, refer to the [Tailwind CSS Next.js Guide](https://tailwindcss.com/docs/guides/nextjs).
