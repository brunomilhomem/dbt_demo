# DBT POC using Snowflake Trial Acccess

- Simple demo using dbt with snowflake warehouse

### Snowflake Setup

|  |  |
| ------ | ------ |
| user | DBT_CLOUD |
| role | transformer |
| schema | analytics |
| database | dev |
| warehouse | transformer |

***

### Applying Grants

> Dropping user & role if they already exists.

```sql
use role accountadmin;

drop user if exists dbt_cloud;
drop user if exists dbt_cloud_dev;
drop role if exists transformer;
drop role if exists transformer_dev;
```

> Creating a database.

```sql
create database DEV comment = 'Development database';
```

> Create schemas.

```sql
create schema "DEV"."ANALYTICS" comment = 'Data layer for end user';
```

> Create an access role.

```sql
create role transformer comment = 'Role for dbt';
```

> Create a warehouse.

```sql
create warehouse transforming with 
 warehouse_size = 'XSMALL' 
 warehouse_type = 'STANDARD' 
 auto_suspend = 300 
 auto_resume = TRUE 
 comment = 'Warehouse to transform data';
```

> Granting role permissions

```sql
grant usage,operate on warehouse transforming to role transformer;
grant usage,create schema on database DEV to role transformer;
grant all on schema "DEV"."ANALYTICS" to role transformer;
```

***

## DBT Installation

Sequence of commands:

```dbt
pip install dbt
pip install dbt-snowflake

dbt --version
dbt debug
dbt init
dbt deps
dbt seed
dbt run
dbt docs generate
dbt docs serve --port 8001
```

- You can also install dbt using [these instructions](https://docs.getdbt.com/dbt-cli/install/overview)
  
Profile template:

```yaml
# For more information on how to configure this file, please see:
# https://docs.getdbt.com/docs/profile
dbt_demo:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: your-snowflake-account-id-here
      user: your-user-name-here
      password: your-password-here
      role: TRANSFORMER
      database: DEV
      warehouse: TRANSFORMING
      schema: STG
      threads: 4
      client_session_keep_alive: False
```

### DAGs

![](images/dbt_lineage_graph.png)

***

### DIM & FACT

![](images/dim_customer.png)
![](images/fact_orders.png)

***

### Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
