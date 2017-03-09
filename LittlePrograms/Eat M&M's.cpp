#include <cstdio>
#include <cstring>
#include <algorithm>
#include <vector>
#include <cmath>
#include <cstdlib>
#include <ctime>
using namespace std;
typedef long long ll;
typedef pair<int, int> pii;
const int INF = 0x7f7f7f7f;
const int N = 1e6 + 10;
const double gold = (1 + sqrt(5)) / 2;

class Wythoff
{
private:
	int a, b;
	vector<pii> cold;

	void gene(int range);
	bool Wythoff::check(int aa, int bb);
	bool Wythoff::is_cold(int a, int b);
	bool Wythoff::output();
public:
	Wythoff(int range);
	bool input(int aa, int bb);
};

void Wythoff::gene(int range)
{
	bool vis[N];
	memset(vis, false, sizeof(vis));
	cold.clear();
	int k = -1;
	while (b <= range)
	{
		k++;
		int i = 0;
		while (vis[i]) i++;
		a = i; b = a + k;
		cold.push_back(pii(a, b));
		vis[a] = vis[b] = true;
	}
	cold.erase(cold.end() - 1);
}
Wythoff::Wythoff(int range)
{
	gene(range);
	srand(time(NULL));
	int t = rand() % cold.size();
	if (t == 0) t = cold.size() - 1;
	a = cold[t].first;
	b = cold[t].second;
	printf("M&M's: %d %d\n\n", a, b);
}


bool Wythoff::is_cold(int a, int b)
{
	int k = b - a;
	int aa = k * gold;
	if (aa == a) return true;
	return false;
}
bool Wythoff::output()
{
	vector<pii> vec;
	vec.clear();
	for (int i = 1; i <= a; i++)
		if (is_cold(a - i, b - i))
		{
			vec.push_back(pii(a - i, b - i));
			break;
		}
	for (int i = 1; i <= a; i++)
		if (is_cold(a - i, b))
		{
			vec.push_back(pii(a - i, b));
			break;
		}
	if (b > a)
	{
		for (int i = 1; i <= b; i++)
		{
			int aa = a, bb = b - i;
			if (aa > bb) swap(aa, bb);
			if (is_cold(aa, bb))
			{
				vec.push_back(pii(aa, bb));
				break;
			}
		}
	}

	srand(time(NULL));
	int t = rand() % vec.size();
	a = vec[t].first; b = vec[t].second;
	printf(" Mine: %d %d\n\n", a, b);

	if (a == 0 && b == 0)
	{
		printf("Oh no! You have no M&M's to eat. You lose the Game!\n");
		return true;
	}
	return false;

}

bool Wythoff::check(int aa, int bb)
{
	if (aa < 0 || aa > a || bb < 0 || bb > b) return false;
	if (aa == a && bb == b) return false;
	if (aa < a && bb < b) return a - aa == b - bb;
	return true;

}
bool Wythoff::input(int aa, int bb)
{
	if (!check(aa, bb))
	{
		printf("Invalid input!\n");
		printf("You can eat any number M&M's from one of the piles or eat the same number from both piles.\n\n");
		return false;
	}
	if (aa > bb) swap(aa, bb);
	this->a = aa;
	this->b = bb;
	return output();
}

int main()
{
	printf("*****************************************************************************\n");
	printf("* There are two piles of M&M's candy and we take turns to eat some of them. *\n");
	printf("*                                                                           *\n");
	printf("* You can eat any number of M&M's from either piles or eat the same number  *\n");
	printf("* from both piles.                                                          *\n");
	printf("*                                                                           *\n");
	printf("* The player who have no M&M's to eat will lose the Game.                   *\n");
	printf("*                                                                           *\n");
	printf("* Can you beat me?                                                          *\n");
	printf("*****************************************************************************\n");
	printf("\n");
	printf("Input a numbe. System will generate two piles M&M's randomly.\n");
	int c = '\n';
	while (c == '\n')
	{
		printf("Range: ");
		int range;
		scanf("%d", &range);
		printf("\n");
		Wythoff game(range);
		int a, b;
		printf("Yours: ");
		scanf("%d%d", &a, &b);
		while (true)
		{
			if (game.input(a, b)) break;
			printf("Yours: ");
			scanf("%d%d", &a, &b);
		}
		printf("Press ENTER to try again...");
		c = getchar();
		c = getchar();
		printf("\n");
		printf("----------------------------------------------------------------------------\n");
	}
	return 0;
}