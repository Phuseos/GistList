//Rock, Paper, Scissors in JavaScript

function playGame() {
	//Fires when the user hits the button
	var input = document.getElementById("playTxt").value;	//Value from the input field
	var selection = null;					//Selection, will be build from the input var
	var ansAllowed = true;					//Checks if the input is allowed
	
	//Rework the input to a readable answer
	if (input.toLowerCase() == "r") {
		selection = "Rock";
	} else if (input.toLowerCase() == "p") {
		selection = "Paper";
	} else if (input.toLowerCase() == "s") {
		selection = "Scissors";
	} else {
		ansAllowed = false;
	}
	
	//The answer given is not allowed. Inform the user and return from the function
	if (ansAllowed == false) {
		document.getElementById("pResult").innerHTML = ("Sorry, I didn't understand that. Please use 'r', 's' or 'p' to play.");
		return;
	}
	
	//Get a random int to use 
	var randInt = getRandomInt();
	
	//Decide what to do with the computer response
	var comp_Response = null;
	
	if (randInt == 1) {
		comp_Response = "Rock";
	} else if (randInt == 2) {
		comp_Response = "Paper";
	} else if (randInt == 3) {
		comp_Response = "Scissors";
	}

	//Show the results on the page
	document.getElementById("pInfoUser").innerHTML = "You picked: " + selection;
	document.getElementById("pInfoComputer").innerHTML = "The computer picked: " + comp_Response;
		
	//The result to print
	var result = null;
		
	//Now compare the results
	if (selection == comp_Response) {
		 result = "It's a draw!";
	} else if (selection == "Rock" && comp_Response == "Paper") {
		result = "Paper beats rock, you lose!";
	} else if (selection == "Rock" && comp_Response == "Scissors") {
		result = "Rock beats scissors, you win!";
	} else if (selection == "Paper" && comp_Response == "Rock") {
		result = "Paper beats rock, you win!";
	} else if (selection == "Paper" && comp_Response == "Scissors") {
		result = "Scissors beats paper, you lose!";
	} else if (selection == "Scissors" && comp_Response == "Rock") {
		result = "Rock beats scissors, you lose!";
	} else if (selection == "Scissors" && comp_Response == "Paper") {
		result = "Scissors beat paper, you win!";
	}
	
	//Print the results
	document.getElementById("pResult").innerHTML = result;
}

function getRandomInt() {	//Generates a random int between 1 and 3
	return Math.floor(Math.random() * (3 - 1 + 1) + 1);
}