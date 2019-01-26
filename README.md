# Instana / Zipkin Tracing Example

This example uses Zipkin instrumentation loaded via Spring Cloud Sleuth to report spans into the Instana agent.
The Instana agent does *not* instrument the applications in this demo with tracing logic.

## Configure

Create a `.env` file in the root of the checked-out version of this repository and enter the following text, with the values adjusted as necessary:
```text
agent_key=<TODO FILL UP>
agent_endpoint=<TODO FILL UP>
```

## Build

```bash
./build.sh
```

## Launch

```bash
docker-compose up
```

This will build and launch
- `client-app`, a simple Spring Boot application that issues a request every second to the ...
- `server-app`, a simple Spring Boot application that serves all incoming HTTP requests with a `200 OK` status

Both `client-app` and `server-app` report spans over Zipkin to the Instana agent available at the `instana-agent` address in the docker-compose network.

## Setup the Application Perspective for the Demo

The simplest way is just to assign to the agent a unique zone (the `docker-compose.yml` file comes with the pre-defined `zipkin-dockerized-demo`), and simply create the application to contain all calls with the `agent.zone` tag to have the value `zipkin-dockerized-demo`.

## Known limitations

Since we are not using Instana automagic instrumentation, there is no link between the Spring Boot applications detected (but not instrumented) by the Instana agent and the services present in the Application Perspective screens.