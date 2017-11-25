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
	entrada = fopen("Entrada.txt", "rt");
	saida = fopen("EntradaCerta.txt", "wt");
	
	if(entrada == NULL || saida ==NULL)
	{
		printf("Erro ao abrir o arquivo\n");
		return 0;
	}
	printf("Abriu o arquivo com sucesso\n");
	int cont = 0;
	while(!feof(entrada))
	{
		result = fgets(Linha, MAXCHAR, entrada);
		puts(Linha);
		int tamanho = strlen(Linha);
		cont++;
		printf("pegou a linha %d\n", cont);
		if(result)
		{
			i= 0;
			contador = 0;
			while(i < tamanho)//enquanto nao chego no final da linha
			{
				
				printf("char=%c", Linha[i]);
				
				if(Linha[i] == ' ' || Linha[i] == '	')
				{
					contador++;
				}
				i++;
				//puts("OI");
				//putchar(Linha[i]);			
			}
			puts("SAIU");
			if(contador == 2)
			{
				puts("Saiu da linha agora so ler a proxima");
				fputs(Linha, saida);
			}
		}
	}
	
	fclose(entrada);
	fclose(saida);
	
}
