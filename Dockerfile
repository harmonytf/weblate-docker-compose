FROM weblate/weblate

COPY overrides/translate/vdf.py /usr/local/lib/python3.10/site-packages/translate/storage/vdf.py

COPY overrides/weblate/vdf.py /usr/local/lib/python3.10/site-packages/weblate/formats/vdf.py
COPY overrides/weblate/models.py /usr/local/lib/python3.10/site-packages/weblate/formats/models.py

COPY overrides/weblate_language_data/aliases.py /usr/local/lib/python3.10/site-packages/weblate_language_data/aliases.py
COPY overrides/weblate_language_data/language_codes.py /usr/local/lib/python3.10/site-packages/weblate_language_data/language_codes.py

HEALTHCHECK --interval=30s --timeout=3s CMD /app/bin/health_check
SHELL ["/bin/bash", "-o", "pipefail", "-x", "-c"]
EXPOSE 8080
VOLUME /app/data
VOLUME /app/cache
ENTRYPOINT ["/app/bin/start"]
CMD ["runserver"]
