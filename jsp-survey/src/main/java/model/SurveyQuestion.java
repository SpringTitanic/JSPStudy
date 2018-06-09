package model;

import java.util.List;

public class SurveyQuestion {

    /* variable */
    private int questionId;
    private String questionText;
    private List<SurveyChoice> choiceList;

    /* toString */
    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("questionId=").append(questionId);
        sb.append(",questionText=").append(questionText);
        sb.append(",choiceList=").append(choiceList);
        
        return sb.toString();
    }
    
    /* getter, setter */
    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public String getQuestionText() {
        return questionText;
    }

    public void setQuestionText(String questionText) {
        this.questionText = questionText;
    }

    public List<SurveyChoice> getChoiceList() {
        return choiceList;
    }

    public void setChoiceList(List<SurveyChoice> choiceList) {
        this.choiceList = choiceList;
    }

}
