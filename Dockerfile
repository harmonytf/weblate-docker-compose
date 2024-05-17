FROM weblate/weblate:5.5.5.1

COPY overrides/translate/vdf.py /app/venv/lib/python3.12/site-packages/translate/storage/vdf.py

COPY overrides/weblate/formats/vdf.py overrides/weblate/formats/models.py /app/venv/lib/python3.12/site-packages/weblate/formats/
COPY overrides/weblate/settings_docker.py /app/venv/lib/python3.12/site-packages/weblate/
COPY overrides/weblate/checks/source_engine.py overrides/weblate/checks/models.py /app/venv/lib/python3.12/site-packages/weblate/checks/

#COPY overrides/weblate_language_data/aliases.py overrides/weblate_language_data/language_codes.py /app/venv/lib/python3.12/site-packages/weblate_language_data/

HEALTHCHECK --interval=30s --timeout=3s --start-period=5m CMD /app/bin/health_check
SHELL ["/bin/bash", "-o", "pipefail", "-x", "-c"]
EXPOSE 8080
VOLUME /app/data
VOLUME /app/cache
VOLUME /tmp
VOLUME /run
ENTRYPOINT ["/app/bin/start"]
CMD ["runserver"]
