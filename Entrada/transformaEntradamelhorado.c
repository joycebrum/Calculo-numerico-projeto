#include <stdio.h>
#include <string.h>
#define MAXCHAR 1000
int main()
{
	FILE *entrada, *saida;
	char *result;
	char Linha[MAXCHAR];
	int contador;
	int i;
	Linha[0] = '\0';
	entrada = fopen("EntradaCerta.txt", "rt");
	saida = fopen("EntradaFinal.txt", "wt");
	
	if(entrada == NULL || saida ==NULL)
	{
		printf("Erro ao abrir o arquivo\n");
		return 0;
	}
	printf("Abriu o arquivo com sucesso\n");
	while(!feof(entrada))
	{
		result = fgets(Linha, MAXCHAR, entrada);
		int tamanho = strlen(Linha);
		if(result)
		{
			i= 0;
			contador = 1;
			while(i < tamanho)//enquanto nao chego no final da linha
			{
				if(Linha[i] >= '0' && Linha[i] <= 9)//numero
				{
					i++;
					continue;
				}
				if(Linha[i] == '.')//ainda eh o mesmo numero
				{
					i++;
					continue;
				}
				while(Lista[i] == ' ' || Lista[i]=='	')
				{
					i++;
				}
				if(Linha[i] >= '0' && Linha[i] <= 9)//numero
				{
					i++;
					contador++;
				}		
			}
			puts("SAIU");
			if(contador == 3)
			{
				puts("ESCREVE NO ARQUIVO");
				fputs(Linha, saida);
			}
		}
	}
	
	fclose(entrada);
	fclose(saida);
	
}
