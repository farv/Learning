class HighScores
    attr_reader :scores
    def initialize(scores)
        @scores = scores
    end

    def latest
        @scores.last
    end

    def personal_best
        @scores.max
    end

    def personal_top
        @scores.max(3)
    end

    def report 
        "Your latest score was #{latest}. #{sentence_to_best}"
    end

    def sentence_to_best
        diff = personal_best - latest
        if diff > 0 then
            "That's #{diff} short of your personal best!"
        else
            "That's your personal best!"
        end
    end
end