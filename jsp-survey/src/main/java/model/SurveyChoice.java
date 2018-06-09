package model;

public class SurveyChoice {

    /* variable */
    private int choiceId;
    private int questionId;
    private int choiceNumber;
    private String choiceText;

    /* toString */
    @Override
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("choiceId=").append(choiceId);
        sb.append(",questionId=").append(questionId);
        sb.append(",choiceNumber=").append(choiceNumber);
        sb.append(",choicetext=").append(choiceText);

        return sb.toString();
    }

    /* getter, setter */
    public int getChoiceId() {
        return choiceId;
    }

    public void setChoiceId(int choiceId) {
        this.choiceId = choiceId;
    }

    public int getQuestionId() {
        return questionId;
    }

    public void setQuestionId(int questionId) {
        this.questionId = questionId;
    }

    public int getChoiceNumber() {
        return choiceNumber;
    }

    public void setChoiceNumber(int choiceNumber) {
        this.choiceNumber = choiceNumber;
    }

    public String getChoiceText() {
        return choiceText;
    }

    public void setChoiceText(String choiceText) {
        this.choiceText = choiceText;
    }

}
