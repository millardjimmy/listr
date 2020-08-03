module QuestionsHelper

    def questions_header
        if @category
            tag.h1("Questions about #{@category.name.capitalize}")
        else
            tag.h1("All Questions")
        end
    end
end
