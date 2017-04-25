int val1 = 0;
int val2 = 0;

int vind1 = 0;
int vind2 = 1;
int vind3 = 2;
int sol1 = 3;

 
void setup() {
   Serial.begin(9600);
  // put your setup code here, to run once:
 
}
 
void loop() {
  // put your main code here, to run repeatedly:
  //add as many Serial prints as you want ( 
  val1 = analogRead(sol1);
  val2 = analogRead(sol1);
  Serial.print(val1);
  Serial.print('.');
  Serial.print(val2);
  Serial.print('.');
  Serial.print(val1);
  Serial.print('.');
  Serial.print(val2);
  Serial.print('.');
  delay(2);

}
