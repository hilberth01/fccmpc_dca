<?php
// starting word
$word = new com("word.application") or die("Unable to instantiate Word");
echo "Loaded Word, version {$word->Version}\n";

//bring it to front
$word->Visible = 1;

//open an empty document
$word->Documents->Add();

//do some weird stuff
$word->Selection->TypeText("This is a test...");
$word->Documents[1]->SaveAs("Useless test.doc");

//closing word
$word->Quit();

//free the object
$word = null;
?>

<?php
  $word = new COM("Word.Application") or die ("Could not initialise Object.");
  // set it to 1 to see the MS Word window (the actual opening of the document)
  $word->Visible = 0;
  // recommend to set to 0, disables alerts like "Do you want MS Word to be the default .. etc"
  $word->DisplayAlerts = 0;
  // open the word 2007-2013 document 
  $word->Documents->Open('C:\xampp\htdocs\coop\test\test123.docx');
  // save it as word 2003
  $word->ActiveDocument->SaveAs('C:\xampp\htdocs\coop\test\newdocument.doc');
  // convert word 2007-2013 to PDF
  $word->ActiveDocument->ExportAsFixedFormat('C:\xampp\htdocs\coop\test\yourdocument.pdf', 17, false, 0, 0, 0, 0, 7, true, true, 2, true, true, false);
  // quit the Word process
  $word->Quit(false);
  // clean up
  unset($word);
?>