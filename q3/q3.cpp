#include<bits/stdc++.h>
typedef unsigned long ul;
using namespace std;

int char_to_num(char ch){
		if(ch>='0' && ch<='9'){
				return ch-'0';
		}
		else{
				return ch-'A' + 10;
		}
}

char num_to_char(int m){
		if(m>=0 && m<=9){
				return '0'+m;
		}
		else{
				return 'A'+m-10;
		}
}

bool check(int x, char s1[], char s2[], char op){
	if(x<=1 || x>35){
			return false;
	}
	for(int i=0; i<strlen(s1);i++){
		if(!((s1[i]>='0' && s1[i]<='9') || (s1[i]>='A' && s1[i]<='Z'))){
				return false;
		}
		if(char_to_num(s1[i])>=x){
				return false;
		}
	}
	for(int i=0; i<strlen(s2);i++){
		if(!((s2[i]>='0' && s2[i]<='9') || (s2[i]>='A' && s2[i]<='Z'))){
				return false;
		}
		if(char_to_num(s2[i])>=x){
				return false;
		}
	}
	if(!(op=='+' || op=='-' || op=='*' || op=='/')){
		return false;
	}
	return true;
}

void reverse(char str[]){
    int i,j;
    char ch;
    i=0;
    j=strlen(str)-1;
    while(i<j){
      ch=str[i];
      str[i]=str[j];
      str[j]=ch;
      i++;
      j--;
    }
}
void codecheck()
{
	int i=0;
	while(i<=10000)
		{i++;}
}
int main(){
	codecheck();
	int k, l;
	ul x, x_pow,num1=0,num2=0,res=0;
	char s1[51],s2[51],result[51],op;
	memset(result,'\0',51*sizeof(result[0]));
	cout<<"Input radix_x, 2 operands in radix_x and the operator(+, -, *, /)\n";
	cin>>x>>s1>>s2>>op;
	if(!check(x,s1,s2,op)){
			cout<<"Invalid input\n";
			return 0;
	}
	reverse(s1);
	x_pow = 1;
	for(k=0;k<strlen(s1);k++){
			num1 += char_to_num(s1[k]) * x_pow;
			x_pow*=x;
	}
	reverse(s2);
	x_pow = 1;
	for(l=0;l<strlen(s2);l++){
			num2 += char_to_num(s2[l]) * x_pow;
			x_pow*=x;
	}
	switch(op){
			case '+': res = num1+num2;
								break;
			case '-': res = num1>num2 ? num1-num2 : num2-num1;
								break;
			case '*': res = num1*num2;
								break;
			case '/': if(num2==0){
									cout<<"Operation not possible";
									return 0;
								}
								res = num1/num2;
								break;
	}
	if(res==0){
			cout<<"0";
	}
	else{
			if(num1<num2 && op=='-'){
					cout<<"-";
			}
			l = 0;
			while(res>0){
				result[l]=num_to_char(res%x);
				res = res/x;
				l++;
			}
			reverse(result);
			cout<<result;
	}
	return 0;
}
