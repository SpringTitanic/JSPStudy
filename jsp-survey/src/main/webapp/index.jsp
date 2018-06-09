<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="util.CommonUtil"%>
<%@ page import="model.SurveyChoice"%>
<%@ page import="model.SurveyQuestion"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>

<html>
<head>
<title>설문</title>
</head>
<body>
    <%
        String dbUrl = "jdbc:mysql://127.0.0.1:3306/titanic";
        String dbUser = "titanic";
        String dbPassword = "titanic";

        Connection conn = null;

        Statement questionStmt = null;
        ResultSet questionRs = null;

        Statement choiceStmt = null;
        ResultSet choiceRs = null;

        List<SurveyQuestion> questionList = new ArrayList<SurveyQuestion>();

        try {
            /* mysql connector 6.x 사용시 */
            // Class.forName("com.mysql.cj.jdbc.Driver");
            /* mysql connector 5.x 이하 사용시 */
            Class.forName("com.mysql.jdbc.Driver");

            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            String questionQuery = "SELECT * FROM SURVEY_QUESTIONS";
            System.out.println("query: " + questionQuery);
            questionStmt = conn.createStatement();
            questionRs = questionStmt.executeQuery(questionQuery);

            while (questionRs.next()) {
                SurveyQuestion surveyQuestion = new SurveyQuestion();

                int questionId = questionRs.getInt("QUESTION_ID");
                String questionText = questionRs.getString("QUESTION_TEXT");
                List<SurveyChoice> choiceList = new ArrayList<SurveyChoice>();

                String choiceQuery = "SELECT * FROM SURVEY_CHOICES WHERE QUESTION_ID = " + questionId;
                System.out.println("query: " + choiceQuery);
                choiceStmt = conn.createStatement();
                choiceRs = choiceStmt.executeQuery(choiceQuery);

                while (choiceRs.next()) {
                    SurveyChoice surveyChoice = new SurveyChoice();

                    int choiceId = choiceRs.getInt("CHOICE_ID");
                    int choiceNumber = choiceRs.getInt("CHOICE_NUMBER");
                    String choiceText = choiceRs.getString("CHOICE_TEXT");

                    surveyChoice.setChoiceId(choiceId);
                    surveyChoice.setQuestionId(questionId);
                    surveyChoice.setChoiceNumber(choiceNumber);
                    surveyChoice.setChoiceText(choiceText);

                    choiceList.add(surveyChoice);
                } // while end

                CommonUtil.close(choiceRs);
                CommonUtil.close(choiceStmt);

                surveyQuestion.setQuestionId(questionId);
                surveyQuestion.setQuestionText(questionText);
                surveyQuestion.setChoiceList(choiceList);

                System.out.println(surveyQuestion);
                questionList.add(surveyQuestion);
            } // while end

            pageContext.setAttribute("questionList", questionList);

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            CommonUtil.close(choiceRs);
            CommonUtil.close(choiceStmt);
            CommonUtil.close(questionRs);
            CommonUtil.close(questionStmt);
            CommonUtil.close(conn);
        }
    %>
    <c:forEach var="question" items="${questionList}">
        <c:if test="${fn:length(question.choiceList) > 0}">
            <p>Q. ${question.questionText}</p>
            <c:forEach var="choice" items="${question.choiceList}">
                <p>${choice.choiceText}</p>
            </c:forEach>
        </c:if>
    </c:forEach>
</body>
</html>
