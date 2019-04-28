class BudgetApproverPolicy
    attr_reader :current_account, :model
  
    def initialize(current_account, model)
      @current_account = current_account
      @budget_approver = model
    end
  
    def edit?
      @current_account == @budget_approver.account
    end
  
    def update?
      @current_account == @budget_approver.account
    end

    def show_items_for_budget_approver?
      @current_account == @budget_approver.account
    end

    def show_taf_items_for_budget_approver?
      @current_account == @budget_approver.account

    def show_carts_for_budget_approver?
      @current_account == @budget_approver.account
    end
  
    def show_tafs_for_budget_approver?
      @current_account == @budget_approver.account
    end
  
  end