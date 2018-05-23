{%- if pillar.keycloak is defined %}
include:
{%- if pillar.keycloak.server is defined %}
- keycloak.server
{%- endif %}
{%- if pillar.keycloak.proxy is defined %}
- keycloak.proxy
{%- endif %}
{%- endif %}
