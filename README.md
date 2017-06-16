# Mars Robots Technical Tests

Thank you for providing a interesting technical test. I understand that a technical test gives an opportunity to demonstrate that I can construct a object heiraky, encapulating discret behaviour within each object. I considered an approach like this

```
class L; end; class R; end; class F; end; ...
```

However given the requirement for a Keep It Simple Stupid approach, I have instead used an approach based on vectors and polar coordinates to provide this behaviour:

```
bin/martian_robots.rb --load ./docs/sample_input.txt
```
### Errata
I have found a typo in the Sample Output. The provided sample input and output indicates that a starting position of '0 3 W' and a movement sequence of 'LLFFFLFLFL' results in a final position of '2 3 S'. however, if you plot it out
```
0 3 W 
0 3 S
0 3 E
1 3 E
2 3 E
3 3 E
3 3 N
3 3 N LOST
```
This must be a typo, if the starting position was '0 2 W' then the plot would be
```
0 2 W
0 2 S
0 2 E
1 2 E
2 2 E
3 2 E
3 2 N
3 3 N
3 3 W
2 3 W
2 3 S
2 3 S
```
Therefore I am replacing '0 3 W' with '0 2 W' in the Sample Input, docs/sample_input.txt

