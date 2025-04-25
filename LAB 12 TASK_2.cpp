#include<iostream>
using namespace std;
int main()
{
	unsigned char a[80];unsigned char b[80];unsigned char even[8];unsigned char odd[8]; int sum1 = 0, sum2 = 0;

	for (int i = 0; i < 80; ++i)
	{
		a[i] = i + 1;
		b[i] = i + 1;
	}

	for (int i = 0; i < 80;++i)
	{
		__asm
		{
			mov esi,i
			mov al, [a+esi]
			shr al,1
			jnc skip
			mov[a+esi],0
			skip:
			mov al, [b+esi]
			shr al,1
			jc skip1
			mov[b + esi],0
			skip1:
		}
	}
	__asm
	{
		movq mm0,a
		movq mm1,b
	}

	for (int i = 8; i < 80; i += 8)
	{
		__asm
		{
			mov esi,i
			paddb mm0, [a+esi]
			paddb mm1, [b+esi]
		}
	}
	__asm
	{
		movq [even],mm0
		movq[odd],mm1
		emms
	}

	for (int i = 0; i < 8; ++i)
	{
		sum1 += even[i];
		sum2 += odd[i];
	}

	cout << "Even: " << sum1 << endl;
	cout << "Odd: " << sum2 << endl;

	return 0;
}