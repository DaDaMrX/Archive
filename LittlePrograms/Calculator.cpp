/*
整数小数均可，支持加减乘除乘方，表达式中可加空格，最后输不输入等号都行。
*/

#include <cstdio>
#include <cstring>
#include <cmath>
#include <stack>
using namespace std;
#define N 100
char s[N];
int length, i;
stack<double> num;
stack<char> op;
double calc(double a, char o, double b)
{
	switch (o)
	{
	case '+': return a + b;
	case '-': return a - b;
	case '*': return a * b;
	case '/': return a / b;
	case '^': return pow(a, b);
	}
}
int pro(char o)
{
	switch (o)
	{
	case '#': return -1;
	case '+':
	case '-': return 1;
	case '*':
	case '/': return 2;
	case '^': return 3;
	case '(': return 0;
	}
}
double getNumber()
{
	char number[N];
	int j = 0;
	while ((i < length) && (s[i] >= '0' && s[i] <= '9' || s[i] == '.')) number[j++] = s[i++];
	number[j] = '\0';
	return atof(number);
}
void back()
{
	double b = num.top(); num.pop();
	double a = num.top(); num.pop();
	char o = op.top(); op.pop();
	num.push(calc(a, o, b));
}
double calculate()
{
	op.push('#');
	length = strlen(s);
	i = 0;
	while (i < length)
	{
		if (s[i] >= '0' && s[i] <= '9')
		{
			num.push(getNumber());
			continue;
		}
		switch (s[i])
		{
		case ' ': i++; break;
		case '(': op.push(s[i++]); break;
		case ')': 
			while (op.top() != '(')	back();
			op.pop();
			i++;
			break;
		case '=':
		case '\n':
			while (op.top() != '#') back();
			return num.top();
		default:
			while (pro(op.top()) >= pro(s[i])) back();
			op.push(s[i++]);
		}
	}
}
int main()
{
	fgets(s, sizeof(s), stdin);
	printf("%lf\n", calculate());
	return 0;
}