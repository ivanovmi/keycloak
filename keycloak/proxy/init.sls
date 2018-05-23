{%- from "keycloak/map.jinja" import proxy with context %}
{%- from "keycloak/map.jinja" import base with context %}

{%- if proxy.enabled|default(False) %}
keycloak_proxy_dir:
  file.directory:
    - name: {{ base.dir }}/proxy
    - user: root
    - group: root
    - mode: 0755
    - makedirs: true

keycloak_proxy_conf:
  file.managed:
    - name: {{ base.dir }}/proxy/proxy.json
    - source: salt://keycloak/files/proxy/proxy.json
    - template: jinja
    - user: root
    - mode: 0644
    - require:
      - file: keycloak_proxy_dir
{%- endif %}
