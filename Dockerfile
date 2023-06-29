FROM weblate/weblate:4.18.1.1

COPY overrides/translate/vdf.py /usr/local/lib/python3.11/site-packages/translate/storage/vdf.py

COPY overrides/weblate/formats/vdf.py overrides/weblate/formats/models.py /usr/local/lib/python3.11/site-packages/weblate/formats/
COPY overrides/weblate/settings_docker.py /usr/local/lib/python3.11/site-packages/weblate/
COPY overrides/weblate/checks/source_engine.py overrides/weblate/checks/models.py /usr/local/lib/python3.11/site-packages/weblate/checks/

#COPY overrides/weblate_language_data/aliases.py overrides/weblate_language_data/language_codes.py /usr/local/lib/python3.11/site-packages/weblate_language_data/

HEALTHCHECK --interval=30s --timeout=3s CMD /app/bin/health_check
SHELL ["/bin/bash", "-o", "pipefail", "-x", "-c"]
EXPOSE 8080
VOLUME /app/data
VOLUME /app/cache
ENTRYPOINT ["/app/bin/start"]
CMD ["runserver"]
