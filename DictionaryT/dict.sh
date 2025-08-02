#!/usr/bin/env python3

import requests

def define_word(word):
    url = f"https://api.dictionaryapi.dev/api/v2/entries/en/{word}"

    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()

        print(f"\nWord: {data[0]['word']}")

        for meaning in data[0]['meanings']:
            print(f"\nPart of Speech: {meaning['partOfSpeech']}")
            for definition in meaning['definitions']:
                print(f"- {definition['definition']}")

    except requests.exceptions.HTTPError:
        print(f"No definition found for '{word}'.")
    except Exception as e:
        print(f"Error: {e}")

def exec():
    print("type 'q' to exit \n")
    while True:
        print("######################################################################################## \n")
        word = input("Enter word: ").strip()
        if word.lower() == "q":
            print("exiting...")
            break
        elif word:
            define_word(word)
        else:
            print("Enter a valid word.")
exec()
