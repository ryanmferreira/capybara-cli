#include <iostream>
#include <fstream>
#include <stdint.h>
#include <string>

using namespace std;

const string capybara[9] = {
    "    /\\__/\\_",
    "   /       \\",
    "  /    0    \\----------_",
    " | Y                    \\",
    " \\______/                \\",
    "       \\                 |",
    "        |   /-______-|    \\",
    "        |   |         \\   /",
    "       //__/         //__/"};

constexpr uint8_t capybaraLines = sizeof(capybara) / sizeof(capybara[0]);
constexpr uint8_t maxPerLine = 32;
constexpr uint8_t textStartLine = 2;

string fileText;

int processParameters(char *argv[]);

int main(int argc, char *argv[])
{
    string input;

    if (argc > 1)
    {
        if (processParameters(argv) == 1)
        {
            return 0;
        }

        ifstream file(argv[1]);

        // Now we read files, which is pretty cool! :D
        if (file.is_open())
        {
            while (getline(file, fileText))
            {
                input += fileText + " ";
            }

            file.close();
        }
        else
        {
            input = string(argv[1]);
        }
    }
    else
    {
        input = "Capybara Supremacy!";
    }

    // Calculate the longest row of the capybara to align the text properly
    size_t biggestLine = 0;
    for (const auto line : capybara)
    {
        if (line.length() > biggestLine)
        {
            biggestLine = line.length();
        }
    }

    // ! We need to refactor this code snippet to break down entire words instead of everything
    // Break the line into multiple lines if it exceeds the maximum characters per line
    for (int8_t i = 0; i < capybaraLines; i++)
    {
        cout << capybara[i];

        int32_t textIndex = i - textStartLine;
        int32_t startChar = textIndex * maxPerLine;

        if (textIndex >= 0 && startChar < input.length())
        {
            string preText(biggestLine - capybara[i].length() + 2, ' ');

            cout << preText << input.substr(startChar, maxPerLine);
        }

        cout << endl;
    }

    return 0;
}

int processParameters(char *argv[])
{
    string param = argv[1];

    if (param == "--help" || param == "-h")
    {
        cout << "Usage: capybara [text or file]" << endl;
        cout << "Options:" << endl;
        cout << " --help    Shows this help menu" << endl;
        cout << " --version Shows the program version" << endl;

        return 1;
    }

    if (param == "--version" || param == "-v")
    {
        cout << "Capybara CLI v1.0.0" << endl;
        return 1;
    }

    return 0;
}