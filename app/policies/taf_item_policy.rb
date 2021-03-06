class TafItemPolicy
    attr_reader :current_account, :model
  
    def initialize(current_account, model)
      @current_account = current_account
      @taf_item = model
    end
  
    def index?
      current_account.accountable_type == "Employee"

    end
  
    def show?
      @current_account == @taf_item.employee.account
      current_account.accountable_type == "Employee"

    end
  
    def new?
      current_account.accountable_type == "Employee"
    end
  
    def create?
      current_account.accountable_type == "Employee"
    end
  
    def edit?
      @current_account == @taf_item.employee.account
      current_account.accountable_type == "Employee"

    end
  
    def update?
      @current_account == @taf_item.employee.account

    end
  
    def destroy?
      @current_account == @taf_item.employee.account
    end
  
    class Scope < Struct.new(:current_account, :model)
      def resolve
          model.where(employee: current_account.accountable)
          model.where(budget_approver: current_account.accountable)
          model.where(payment_manager: current_account.accountable)
      end
    end
  
  end