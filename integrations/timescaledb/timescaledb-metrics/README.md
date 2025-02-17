## Overview

<!-- Sensu Integration description; supports markdown -->

The timescaledb-metrics integration provides a pipeline for delivering sensu metrics to a TimescaleDB table.

This integration includes the following resources:

* `timescaledb-metrics` [pipeline]
* `timescaledb-metrics` [handler]
* `sensu/sensu-timescaledb-handler` [asset]

## Dashboards


There are no compatible dashboards for this integration.

## Setup

<!-- Sensu Integration setup instructions, including Sensu agent configuration and external component configuration -->
<!-- EXAMPLE: what configuration (if any) is required in a third-party service to enable monitoring? -->

1. Set up a [TimescaleDB][timescaledb-docs] database with access for your sensu backend.

   See [sensu/sensu-timescaledb-handler][sensu/sensu-timescaledb-handler-github] docs for recommendations.
    
   **Example**: 
    
   ```sql
   CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;
   CREATE TABLE metrics (
     time    TIMESTAMPTZ         NOT NULL,
     name    TEXT                NOT NULL,
     value   DOUBLE PRECISION    NULL,
     source  TEXT                NOT NULL,
     tags    JSONB
   );
   ```


## Plugins

- [sensu/sensu-timescaledb-handler][sensu/sensu-timescaledb-handler-bonsai] ([GitHub][sensu/sensu-timescaledb-handler-github])

## Metrics & Events

This integration does not produce any [metrics].

## Alerts

This integration does not produce any events that should be processed by an alert or incident management [pipeline].

## Reference Documentation

1. This integration uses [Handler Templating][handler-templating] for variable substitution.

<!-- Links -->
[check]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/checks/
[asset]: https://docs.sensu.io/sensu-go/latest/plugins/assets/
[subscription]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[subscriptions]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/subscriptions/
[agents]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/
[annotation]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/agent/#general-configuration-flags
[plugins]: https://docs.sensu.io/sensu-go/latest/plugins/
[metrics]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/metrics/
[pipeline]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/pipelines/
[handler]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handlers/
[tokens]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-schedule/tokens/
[handler-templating]: https://docs.sensu.io/sensu-go/latest/observability-pipeline/observe-process/handler-templates/
[sensu-plus]: https://sensu.io/features/analytics
[sensu/sensu-timescaledb-handler-bonsai]: https://bonsai.sensu.io/assets/sensu/sensu-timescaledb-handler
[sensu/sensu-timescaledb-handler-github]: https://github.com/sensu/sensu-timescaledb-handler
[timescaledb-docs]: https://docs.timescale.com/
