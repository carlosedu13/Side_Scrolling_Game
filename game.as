//Global var
var left:Boolean = false;
var right:Boolean = false;
var up:Boolean = false;
var down:Boolean = false;
var backgroundStatic:Boolean = false;
var boxSpeed:int = 5;
var numberOfLifes:Number = 3;
var score:Number = 0;

textInputHealth.text = numberOfLifes.toString();

setInterval(detectCollision, 1);
setInterval(punctuation, 200);

stop(); 

//call function
homeButton.addEventListener(MouseEvent.CLICK, home);
stage.addEventListener(KeyboardEvent.KEY_UP, touchUpKey);
stage.addEventListener(KeyboardEvent.KEY_DOWN, touchDownKey);
stage.addEventListener(Event.ENTER_FRAME, backgroundMove);
stage.addEventListener(KeyboardEvent.KEY_DOWN, jump);
stage.addEventListener(KeyboardEvent.KEY_DOWN, slide);
stage.addEventListener(Event.ENTER_FRAME, boxEnemy);

//functions
function home(event){
	gotoAndPlay(1, "home");
}

function touchUpKey(event){
	if(event.keyCode == Keyboard.LEFT){
		left = false;
	}
	if(event.keyCode == Keyboard.RIGHT){
		right = false;	
	}
	if(event.keyCode == Keyboard.UP){
		up = false;	
	}
	if(event.keyCode == Keyboard.DOWN){
		down = false;	
	}
}

function touchDownKey(event){
	if(event.keyCode == Keyboard.LEFT){
		left = true;
	}
	if(event.keyCode == Keyboard.RIGHT){
		right = true;	
	}
	if(event.keyCode == Keyboard.UP){
		up = true;
	}
	if(event.keyCode == Keyboard.DOWN){
		down = true;
	}
}

function backgroundMove(event){
	if(backgroundStatic == false){
		
		background1.x -= 5;
		background2.x -= 5;
			
		if(background1.x < -613){
				background1.x = 585,10;
		}
		
		if(background2.x < -613){
				background2.x = 585,10;
		}
	}
}

function jump(event){
	if(event.keyCode == Keyboard.UP){
		person_fox.gotoAndPlay(9);
	}
}

function slide(event){
	if(event.keyCode == Keyboard.DOWN){
		person_fox.gotoAndPlay(28);
	}
}

function boxEnemy(event){
	box.x -= boxSpeed;
	box1.x -= boxSpeed;
	box2.x -= boxSpeed;
	
	//Local Var
	var random:Number = Math.floor(Math.random()*(3));
	
	if(box.x < -17 ){
		box.x = 610;
		
		if(random == 0){
			box.gotoAndStop(1);
		}
		
		else if(random == 1){
			box.gotoAndStop(9);
		}
		
		else if(random == 2){
			box.gotoAndStop(17);
		}
	}
	
	if(box1.x < -17 ){
		box1.x = 610;
		
		if(random == 0){
			box1.gotoAndStop(1);
		}
		
		else if(random == 1){
			box1.gotoAndStop(9);
		}
		
		else if(random == 2){
			box1.gotoAndStop(17);
		}
	}
	
	if(box2.x < -17 ){
		box2.x = 610;
		
		if(random == 0){
			box2.gotoAndStop(1);
		}
		
		else if(random == 1){
			box2.gotoAndStop(9);
		}
		
		else if(random == 2){
			box2.gotoAndStop(17);
		}
	}
}

function detectCollision(){
	if (numberOfLifes <= 0){
		gotoAndStop(1, "gameOver");
	}
	else if(person_fox.hitTestObject(box)){
		numberOfLifes--;
		box.x = -100;
		textInputHealth.text = numberOfLifes.toString();
	}
	else if(person_fox.hitTestObject(box1)){
		numberOfLifes--;
		box1.x = -100;
		textInputHealth.text = numberOfLifes.toString();
	}
	else if(person_fox.hitTestObject(box2)){
		numberOfLifes--;
		box2.x = -100;
		textInputHealth.text = numberOfLifes.toString();
	}
}

function punctuation(){
	score += 1;
	if (numberOfLifes != 0){
		textInputScore.text = score.toString();
	}
}