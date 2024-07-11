programa
{          inclua biblioteca Util
           inclua biblioteca Texto

        //Variáveis usadas durante o programa
           const inteiro total = 25

        cadeia nome[total], cidade[total], enter, busca
        inteiro idade[total], quant = 0, ponteiro = 0, n = 0, quant1, x = 0
        caracter opcao, resposta
        logico encontrado = falso 
	
	funcao inicio()
	{     
	     /*Realiza o teste se quant for igual a zero, caso seja, perguntar quantos 
	     resgistros quer realizar, senão, apresenta o menu.*/  
		se(quant == 0)
		{
			
                    limpa()
                    escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")
                    escreva("Quantos registros gostaria de fazer? [Max: ", total, "]\n")
                    leia(quant)
                    
           //Verifica se o valor da quantidade está dentro do permitido.
           se(quant < 1 ou quant > total)
           {

           	     limpa()
           	     escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")	
           	     escreva("ATENÇÃO: Valor não permitido!")
           	     quant = 0      //estaurando o valor padrão
           	     Util.aguarde(2000)
           	     inicio()
           }
		}
		          //Opções disponiveis de acordo com as funções estabelecidas posteriormente
                    limpa()
                    escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")		          
		          escreva(" 1 - Cadastro de novo cliente.\n")
		          escreva(" 2 - Listar clientes cadastrados.\n")
		          escreva(" 3 - Buscar por clientes cadastrados.\n")
		          escreva(" 4 - Alterar quantidade de resgistros.\n")
		          escreva(" 5 - Excluir cliente cadastrado.\n")
		          escreva(" 9 - Sair do sistema.\n")
		          escreva("--------------------------------------\n\n")
		          escreva("Digite a opção desejada:\n")
		          leia(opcao) 

            //Direcionamento para a função escolhida, com base nas opções disponibilizadas anteriormente
            escolha(opcao)
            {
            	     caso '1':
            	     {
            		         cadastro()
            		         pare
            	     }

            	     caso '2':
            	     {
            		         listar()
            		         pare
            	     }

            	     caso '9':
            	     {
            		         sair()
            		         pare
            	     }

            	     caso '3':
            	     {
            		         buscar_cliente()
            		         pare
            	     }

            	     caso '4':
            	     {

            		         alt_quant()
            		         pare 
                 	}

            	     caso '5':
               	{

            		         excluir()
            		         pare
            	     }
            	
			     caso contrario:
			     {        
			     	    //Caso a opção escolhida não seja nenhuma daquelas disponibilizadas anteriormente
			   	         limpa()
			   	         escreva(" ----------------------\n")
		                   escreva("| SISTEMA DE CADASTRO |\n")
		                   escreva("-----------------------\n\n")	
			   	         escreva("\nATENÇÃO: opção invalida!")
			   	         Util.aguarde(2000)
			   	         inicio()
			   	         pare
			     }
            }
		         
	}

	funcao cadastro()
	{       
		  //Registro do número de clientes desejados
		  se(ponteiro < quant) 		  
		   {
		          limpa()
                    escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")	

		          escreva("Informe o nome do(a) cliente: [", ponteiro+1, "/", quant, "]\n")
		          leia(nome[ponteiro])
		          nome[ponteiro] = Texto.caixa_alta(nome[ponteiro])

		          escreva("------------------------------------------------------------\n\n")

		          escreva("Informe a cidade do(a) cliente " + nome[ponteiro] + ":\n")
		          leia(cidade[ponteiro])

		          escreva("------------------------------------------------------------\n\n")

		          escreva("Informe a idade do(a) cliente " + nome[ponteiro] + ":\n")
		          leia(idade[ponteiro])

		          limpa()
		          escreva("\n\nConfirma o cadastro do(a) cliente ", nome[ponteiro], " com ", idade[ponteiro], " anos de idade, da cidade de ", cidade[ponteiro], "? [S/N]")
		          leia(opcao)
		   }
		
	       senao
		  {       //Caso o número de pessoas cadastradas ultrapasse o limite permitido
			     limpa()
                    escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")	
                    escreva("ATENÇÃO: Você atingiu o limite de registros suportado!")
			     Util.aguarde(2000)
			     inicio()
		  }
                    //Caso a opção seja a confirmação do cadastro
		          se(opcao == 's' ou opcao == 'S')
		          {
                           
		          	   ponteiro++     //Incrementando a variavel ponteiro
		          	   limpa()
                            escreva(" ----------------------\n")
		                  escreva("| SISTEMA DE CADASTRO |\n")
		                  escreva("-----------------------\n\n")	
                            escreva("AVISO: Cadastro realizado com sucesso!\n")
		                  Util.aguarde(1000)
	                       inicio()
		          }
		         
		          senao
		          {

		         	       limpa()
                           escreva(" ----------------------\n")
		                 escreva("| SISTEMA DE CADASTRO |\n")
		                 escreva("-----------------------\n\n")	
		         	       escreva("Registro excluido, voltando para o novo cadastro!")
		         	       Util.aguarde(3000)
		         	       cadastro()
                   }
	}
    
	funcao listar()
	
	{              //Função de exposição de todos os clientes já cadastrados
				limpa()
                    escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")	
		          escreva("Relaçao dos clientes cadastrados.\n")

            //Se nenhum cliente tive sido cadastrado 
		  se(ponteiro == 0)
            {

		          escreva("\nNenhum registro foi encontrado!\n\n")	
		          		          	
		  }
		  
		  senao
		  {
		          //Laço de repetição para apresentar todos os clientes já cadastrados
		          para(n = 0; n < ponteiro; n++)
		          {
		          	
		                   escreva("----------------------------------------------\n\n")
		                   escreva("Nome: " + nome[n] + " | Cidade: " + cidade[n] + " | Idade: " + idade[n] + "\n")
		          
		          }
                             escreva("\n\nPressione a tecla [ENTER] para retornar ao inicio.")
		                   leia(enter)
		                   inicio()
		          		          
		          }
	}

	funcao buscar_cliente()
	{              //Procurar cliente especifico pelo nome usando variável lógico
		          encontrado = falso
                    limpa()
                    escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")	
		          escreva("informe o nome da pessoa que gostaria de buscar:\n")
                    leia(busca)
		          busca = Texto.caixa_alta(busca)
		          limpa()

		 para(n = 0; n < ponteiro; n++)
	      {

                    //Buscar por nome dentro do vetor
                    se(busca == nome[n])
                    {
                                escreva(" ----------------------\n")
		                      escreva("| SISTEMA DE CADASTRO |\n")
		                      escreva("-----------------------\n\n")	
                                escreva("Nº. ", n+1, " - Nome: ", nome[n], " - Idade: ", idade[n], " - Cidade: ", cidade[n], "\n")
                       	       encontrado = verdadeiro
                                escreva("\n\nPressione a tecla [ENTER] para retornar ao inicio.")
		                      leia(enter)
		                      inicio()
                       	  
                    }
                    
		 }
		          //Caso não exista nenhum cliente registrado com o nome desejado
		          se(encontrado == falso)
		          {

                               limpa()
                               escreva(" ----------------------\n")
		                     escreva("| SISTEMA DE CADASTRO |\n")
		                     escreva("-----------------------\n\n")	  
		         	           escreva("Nenhum cliente encontrado com esse nome!\n")
		                     Util.aguarde(2000) 
		         }
		         buscar_cliente()
	}

	funcao alt_quant()
	{              //Alterar o número de registros que se pode fazer, com base no valor desejado no inicio
		          limpa()
		          escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")	
		          escreva("Informe a nova quantidade de registro que gostaria de fazer: [Max: ", total, "]\n")
		          leia(quant1)

		          //Verifica se a quantidade está dentro do limite permitido
		          se(quant1 < 1 ou quant1 < quant ou quant1 > total)
		          {
		          	    limpa()
		          	    escreva("ATENÇÃO: Valor não permitido!")
		          	    Util.aguarde(2000)
		          	    inicio()
		          }

		          senao
		          {
		          	    //Recebendo o novo valor de registro
		          	    quant = quant1
		          	    limpa()
		          	    escreva("AVISO: Alterado o total de registros para ", quant1, "!\n")
		          	    escreva("\n\nPressione a tecla [ENTER] para retornar ao inicio.")
		                   leia(enter)
		          	    inicio()
		          }
	}

	funcao excluir()
	{               //Excluir cliente com sobreposição no vetor                  
		           limpa()
		           escreva(" ----------------------\n")
		           escreva("| SISTEMA DE CADASTRO |\n")
		           escreva("-----------------------\n\n")	
		           escreva("Informe o nome do(a) cliente que deseja excluir:\n")
		           leia(busca)
		           
                     encontrado = falso
                     
                     para(n = 0; n < ponteiro; n++)
                     {
                              //Checar a exclusão do cliente, se ele for encontrado na lista de registros
                     	     se(nome[n] == busca)
                     	     {

                     	     	     encontrado = verdadeiro
                     	     	     limpa()
                     	     	     escreva(" ----------------------\n")
		                              escreva("| SISTEMA DE CADASTRO |\n")
		                              escreva("-----------------------\n\n")	
                                        escreva("Gostaia de remover o cliente ", nome[n], "? [S/N]\n")
                                        leia(resposta)

                                        se(resposta == 's' ou resposta == 'S')
                     	     	     {
                     	     	     	    limpa()
                     	     	     	    escreva(" ----------------------\n")
		                                       escreva("| SISTEMA DE CADASTRO |\n")
		                                       escreva("-----------------------\n\n")	
                     	     	              escreva("O usuário ", nome[n], " foi removido com sucesso!\n")    
                     	     	              escreva("\n\nPressione a tecla [ENTER] para retornar ao inicio.")
		                                       leia(enter)                	     	

                                                 //Laço de repetição para excluir o cliente desejado
                     	     	              para(x = n; x < ponteiro-1; x++)
                     	     	              {

                     	     	     	               nome[x] = nome[x+1]
                     	     	     	               idade[x] = idade[x+1]
                     	     	     	               cidade[x] = cidade[x+1]
                     	     	     	     	      
                     	     	              }   
                     	     	              ponteiro--  //Deecrementando a variável ponteiro        
                     	     	     }
                     	     	     senao
                     	     	     {
                     	     	     	    limpa()
                                                 escreva(" ----------------------\n")
		                                       escreva("| SISTEMA DE CADASTRO |\n")
		                                       escreva("-----------------------\n\n")	
                     	     	     	    escreva("O usuário ", nome[n], " foi mantido no cadastro!\n")
                     	     	     	    escreva("\n\nPressione a tecla [ENTER] para retornar ao inicio.")
		                                       leia(enter) 
                     	     	     }
                     	      }    
                     }
                     //Caso nenhum cliente seja encontrado com o nome desejado nos registros
                     se(encontrado == falso)
                     {

                               limpa()
                               escreva(" ----------------------\n")
		                     escreva("| SISTEMA DE CADASTRO |\n")
		                     escreva("-----------------------\n\n")	
                     	      escreva("Nenhum cliente encontrado com esse nome!\n")
                               escreva("\n\nPressione a tecla [ENTER] para retornar ao inicio.")
		                     leia(enter)
                     	      
                     }
                     
                     inicio()
		            
	}

     funcao sair()
     {
     			limpa()
	 	          escreva("Finalizando o programa em 05 segundos. . .")
	 	          Util.aguarde(1000)

	 	          limpa()
	 	          escreva("Finalizando o programa em 04 segundos. . .")
	 	          Util.aguarde(1000)

	 	          limpa()
	 	          escreva("Finalizando o programa em 03 segundos. . .")
	 	          Util.aguarde(1000)

	 	          limpa()
	 	          escreva("Finalizando o programa em 02 segundos. . .")
	 	          Util.aguarde(1000)

	 	          limpa()
	 	          escreva("Finalizando o programa em 01 segundos. . .")
	 	          Util.aguarde(1000)

	 	          limpa()
                    escreva(" ----------------------\n")
		          escreva("| SISTEMA DE CADASTRO |\n")
		          escreva("-----------------------\n\n")		         
		          escreva("Programa finalizado com sucesso! \n\n\n")		        
     	
     }
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 8518; 
 * @DOBRAMENTO-CODIGO = [56, 12, 141, 152, 165, 112, 178, 256, 286, 362];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */