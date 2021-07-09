class ElementsReflex < ApplicationReflex

    def sort
        #binding.pry
        elements = JSON.parse(element.dataset[:elements])
        elements.each do |element|
            element_record = Element.find(element['id'])
            element_record.update(position: element['position'])
        end
        #NOTE: This is a hack! Might break with future versions of stimulus reflex. This instance varible prevent the rest of the rendering (after the above block executes) from happening (and keeps state of each element). 
        @halted = true
    end

end