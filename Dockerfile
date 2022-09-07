FROM weblate/weblate

COPY overrides/translate/vdf.py /usr/local/lib/python3.9/dist-packages/translate/storage/vdf.py

COPY overrides/weblate/vdf.py /usr/local/lib/python3.9/dist-packages/weblate/formats/vdf.py
COPY overrides/weblate/models.py /usr/local/lib/python3.9/dist-packages/weblate/formats/models.py

COPY overrides/weblate_language_data/aliases.py /usr/local/lib/python3.9/dist-packages/weblate_language_data/aliases.py
COPY overrides/weblate_language_data/language_codes.py /usr/local/lib/python3.9/dist-packages/weblate_language_data/language_codes.py

ENTRYPOINT ["/app/bin/start"]
CMD ["runserver"]
