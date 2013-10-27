module ApplicationHelper
    
    def flash_class(type)
        case type
        when :alert
            "alert-danger"
        when :notice
            "alert-succsess"
        else 
            "alert-info"
        end
    end
    
end
