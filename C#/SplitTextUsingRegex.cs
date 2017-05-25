using System.Text.RegularExpressions;

public static string spliceText(string text, int lineLength)
{
    return Regex.Replace(text, "(.{" + lineLength + "})", "$1" + Environment.NewLine);
}

/*

How to use 
If you want to split a string (for example, the text in a textbox) feed the text and the split length to the public static like this : 

string splitText = "This text is 31 characters long";

//The textbox has the rich property, so it allows split lines for this example
TextBoxToSplitText.Text = spliceText(splitText, 19);

//The text in the textbox will become:
This text is 31 cha
racters long

For a practical example, see the PrintLabel project on GitHub
https://github.com/Phuseos/Label-Printer-DYMO

*/