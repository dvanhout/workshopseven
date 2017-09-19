/*
        Author:         Don van Hout
        For:            CMPP264(Java) SAIT OOSD Spring Track 2017
        Description:    Data handling class for Agents in Travel Experts Database
 */

package com.travelexperts.services;

import com.travelexperts.database.TravelExpertsDB;
import com.travelexperts.model.Agent;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AgentService {

    private Connection conn;

    public AgentService() { }

    // retrieves all agents
    public List<Agent> getAgents() {
        List<Agent> agents = new ArrayList<>();
        Statement stmt;
        ResultSet rs;
        try {
            conn = TravelExpertsDB.getConnection();
            assert conn != null;
            stmt = conn.createStatement();
            rs = stmt.executeQuery("SELECT * FROM agents");
            while (rs.next()) {
                agents.add(new Agent(rs.getInt("AgentId"),
                        rs.getString("AgtFirstName"),
                        rs.getString("AgtMiddleInitial"),
                        rs.getString("AgtLastName"),
                        rs.getString("AgtBusPhone"),
                        rs.getString("AgtEmail"),
                        rs.getString("AgtPosition"),
                        rs.getInt("AgencyId")));
            }
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return agents;
    }

    // retrieves one agent from Agents table
    public Agent getAgent(int agentid) {
        Agent agent = null;
        PreparedStatement pstmt;
        ResultSet rs;
        try {
            conn = TravelExpertsDB.getConnection();
            pstmt = conn.prepareStatement("SELECT * FROM agents WHERE AgentId = ?");
            pstmt.setInt(1, agentid);
            rs = pstmt.executeQuery();
            rs.next();
            agent = new Agent(rs.getInt("AgentId"),
                              rs.getString("AgtFirstName"),
                              rs.getString("AgtMiddleInitial"),
                              rs.getString("AgtLastName"),
                              rs.getString("AgtBusPhone"),
                              rs.getString("AgtEmail"),
                              rs.getString("AgtPosition"),
                              rs.getInt("AgencyId")
            );
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return agent;
    }

    // updates one agent
    public boolean updateAgent(Agent agt)  {
        boolean success = false;
        String updateQuery = "UPDATE Agents SET " +
                "AgtFirstName = ?, " +
                "AgtMiddleInitial = ?, " +
                "AgtLastName = ?, " +
                "AgtBusPhone = ?, " +
                "AgtEmail = ?, " +
                "AgtPosition = ?, " +
                "AgencyId = ? " +
                "WHERE AgentId = ?";

        try {
            conn = TravelExpertsDB.getConnection();
            PreparedStatement psmt = conn.prepareStatement(updateQuery);
            psmt.setString(1, agt.getAgtFirstName());
            psmt.setString(2, agt.getAgtMiddleInitial());
            psmt.setString(3, agt.getAgtLastName());
            psmt.setString(4, agt.getAgtBusPhone());
            psmt.setString(5, agt.getAgtEmail());
            psmt.setString(6, agt.getAgtPosition());
            psmt.setInt(7, agt.getAgencyId());
            psmt.setInt(8, agt.getAgentId());
            int result = psmt.executeUpdate();
            if (result > 0) {
                success = true;
            }
        } catch (SQLException | NullPointerException e) {
            System.err.println("Something went wrong");
        }
        return success;
    }

    // insert new record into agent table
    public boolean insertAgent(Agent agent) {
        boolean success = false;
        String insertStatement;
        PreparedStatement pstmt;
        int result;
        try {
            conn = TravelExpertsDB.getConnection();
            insertStatement = "INSERT INTO agents " +
                    "(AgentId, " +
                    "AgtFirstName, " +
                    "AgtMiddleInitial, " +
                    "AgtLastName, " +
                    "AgtBusPhone, " +
                    "AgtEmail, " +
                    "AgtPosition, " +
                    "AgencyId) " +
                    "SELECT MAX(AgentId) + 1, ?, ?, ?, ?, ?, ?, ? FROM agents";

            pstmt = conn.prepareStatement(insertStatement);
            pstmt.setString(1, agent.getAgtFirstName());
            pstmt.setString(2, agent.getAgtMiddleInitial());
            pstmt.setString(3, agent.getAgtLastName());
            pstmt.setString(4, agent.getAgtBusPhone());
            pstmt.setString(5, agent.getAgtEmail());
            pstmt.setString(6, agent.getAgtPosition());
            pstmt.setInt(7, agent.getAgencyId());
            result = pstmt.executeUpdate();

            conn.close();

            if (result > 0) {
                success = true;
            }
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return success;
    }

    // delete an agent from the agents table
    public boolean deleteAgent(int agentId) {
        boolean success = false;
        String deleteStatement;
        PreparedStatement pstmt;
        int result;
        try {
            conn = TravelExpertsDB.getConnection();
            deleteStatement = "DELETE FROM agents " +
                    "WHERE AgentId = ?";

            pstmt = conn.prepareStatement(deleteStatement);
            pstmt.setInt(1, agentId);
            result = pstmt.executeUpdate();

            conn.close();

            if (result > 0) {
                success = true;
            }
        } catch (SQLException | NullPointerException e) {
            e.printStackTrace();
        }
        return success;
    }
}
