class Student < ApplicationRecord
    validates :name, presence: true
    validates :cpf, presence: true, uniqueness: true
    validates :birthdate, presence: true 
    validates :payment_method, presence: true, inclusion: { in: %w(credit_card boleto), message: "-> Invalid payment method." }
    
    validate :check_cpf

    private 
    
    def check_cpf
    #Remove caracteres não numéricos do CPF
        cpf.gsub!(/[^\d]/, '')

        if cpf.length == 11 

            # Cálculo do primeiro dígito verificador (j)
            sum_j = 0
            cont = 10
            0.upto(8) do |i|
                sum_j += cpf[i].to_i * cont
                cont -= 1
            end

            rest = sum_j % 11
            
            if rest == 0 || rest == 1
                j = '0'
            else
                j = (11 - rest).to_s
            end
            
            # Cálculo do segundo dígito verificador (k)
            sum_k = 0
            contk = 11
            0.upto(9) do |i|
                sum_k += cpf[i].to_i * contk
                contk -=1
            end

            rest = sum_k % 11

            if rest == 0 || rest == 1
                k='0'
            else
                k = (11 - (rest)).to_s
            end
            
            
            # Verifica se os dígitos verificadores calculados são iguais aos dígitos do CPF
            if j != cpf[9] && k != cpf[10]
                errors.add(:cpf, '-> Invalid CPF')
            elsif cpf.chars.uniq.length == 1
                errors.add(:cpf, '-> CPF cannot have all digits equal')
            end

        else 
            errors.add(:cpf, '-> CPF must contain 11 digits')
        end    

    end
end