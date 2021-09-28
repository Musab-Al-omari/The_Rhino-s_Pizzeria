function ddddd() {
  let b = 2;
  let d = 196;
  let c = 2;
  for (let i = 0; i < 19; i++) {
    while (d > 1) {
      if (b * 10 + c * 2 + d * 0.2 == 200 && b + c + d == 200) {
        console.log(b, c, d);
      }
      c++;
      d--;
    }
    b++;
    d=195-i
    c=2
    console.log(b+c+d);
  }
}
ddddd();

function ffff() {
let sum=0;
    for (let index = 0; index < 1000; index++) {
        if (index%3==0||index%5==0) {
            sum=sum+index
        }
        
    }
    console.log(sum);
    
}

ffff()