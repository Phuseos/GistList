using Microsoft.Office.Interop.Word;
using Microsoft.VisualBasic;
using System;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Text.RegularExpressions;
using System.Windows.Forms;

//Snippet of the Label-Printer-DYMO Project (https://github.com/Phuseos/Label-Printer-DYMO)

private void btnSaveLabel_Click(object sender, EventArgs e)
{
    //Setup and create the document
    try
    {
        PrintDocument pDoc = new PrintDocument();

        //Get the name to use for the document creation
        string fNameToUse = Interaction.InputBox("What name will the document have?", "Name your document") + ".docx";

        //Don't allow a blanc file name
        if (string.IsNullOrEmpty(fNameToUse.ToString()))
        {
            MessageBox.Show("Please enter a file name.");
            return;
        }

        //String that will hold the folder to be used
        string folderToUse = null;

        //Show the folder dialog and allow the user to select a path
        using (var fbd = new FolderBrowserDialog())
        {
            DialogResult result = fbd.ShowDialog();

            if (result == DialogResult.OK && !string.IsNullOrEmpty(fbd.SelectedPath))
            {
                folderToUse = fbd.SelectedPath;
            }
            else
            {
                MessageBox.Show("You have not selected a folder to write the document to.");
                return;
            }
        }

        FileInfo testFile = new FileInfo(folderToUse + "/" + fNameToUse);

        //Make sure the file does not exist
        if (testFile.Exists)
        {
            DialogResult dResult = MessageBox.Show("Your file already exists, overwrite?", "File already exists", MessageBoxButtons.YesNo);
            if (dResult == DialogResult.No)
            {
                return;
            }
        }

        string fPath = folderToUse + "/" + fNameToUse;

        //Create a new instance of the word application
        Microsoft.Office.Interop.Word.Application wApp = new Microsoft.Office.Interop.Word.Application();

        //Don't show the animation of the Word application
        wApp.ShowAnimation = false;

        //Don't show the Word app to the user
        wApp.Visible = false;

        //Catch missing variables by using an object
        object mWApp = System.Reflection.Missing.Value;

        //Create a new document
        Document wDoc = wApp.Documents.Add(ref mWApp, ref mWApp, ref mWApp, ref mWApp);

        /*
        The margins for our type of paper are
                    Upper: 0.5f
        Left: 2.5f                  Right: 2.5f
                    Lower: 4f
        */

        //Because this is a label, no header nor footer will be added, we do need to set the margins tough.
        wDoc.PageSetup.Orientation = Microsoft.Office.Interop.Word.WdOrientation.wdOrientPortrait;
        wDoc.PageSetup.TopMargin = InchesToPoints(0.5f);
        wDoc.PageSetup.BottomMargin = InchesToPoints(4f);
        wDoc.PageSetup.LeftMargin = InchesToPoints(2.5f);
        wDoc.PageSetup.RightMargin = InchesToPoints(2.5f);

        object fName = fPath;

        //Fill the document with information
        //A fontsize of 24 displays nicely on the label
        Range wRange = wDoc.ActiveWindow.Selection.Range;
        wRange.Text = txtToshLabel.Text;
        wRange.Font.Size = 24;
        wRange.Font.Name = "Calibri";

        //Save the document
        wDoc.SaveAs2(ref fName);

        //Close and clean the document
        wDoc.Close(ref mWApp, ref mWApp, ref mWApp);

        wDoc = null;

        wApp.Quit();

        wApp = null;

        MessageBox.Show("File saved as " + fName);
    }
    catch (Exception)
    {
        throw;
    }
}