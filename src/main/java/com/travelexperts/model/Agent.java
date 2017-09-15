/*
 * Project Workshop CMPP264(Java)
 * Author: Don
 * Purpose:
 * Date: September 2017
 *
 * */

package com.travelexperts.model;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Agent {
    // --- FIELDS (matches Travel Experts DB)
    private int AgentId;
    private String AgtFirstName;
    private String AgtMiddleInitial;
    private String AgtLastName;
    private String AgtBusPhone;
    private String AgtEmail;
    private String AgtPosition;
    private int AgencyId;


    // --- CONSTRUCTORS
    // constructor with all fields
    public Agent(int agentId,
                 String agtFirstName,
                 String agtMiddleInitial,
                 String agtLastName,
                 String agtBusPhone,
                 String agtEmail,
                 String agtPosition,
                 int agencyId) {
        AgentId = agentId;
        AgtFirstName = agtFirstName;
        AgtMiddleInitial = agtMiddleInitial;
        AgtLastName = agtLastName;
        AgtBusPhone = agtBusPhone;
        AgtEmail = agtEmail;
        AgtPosition = agtPosition;
        AgencyId = agencyId;
    }

    // empty constructor
    public Agent() {
    }

    // --- GETTERS AND SETTERS

    public int getAgentId() { return AgentId; }
    public void setAgentId(int agentId) { AgentId = agentId; }

    public String getAgtFirstName() { return AgtFirstName; }
    public void setAgtFirstName(String agtFirstName) { AgtFirstName = agtFirstName; }

    public String getAgtMiddleInitial() { return AgtMiddleInitial; }
    public void setAgtMiddleInitial(String agtMiddleInitial) { AgtMiddleInitial = agtMiddleInitial; }

    public String getAgtLastName() { return AgtLastName; }
    public void setAgtLastName(String agtLastName) { AgtLastName = agtLastName; }

    public String getAgtBusPhone() { return AgtBusPhone; }
    public void setAgtBusPhone(String agtBusPhone) { AgtBusPhone = agtBusPhone; }

    public String getAgtEmail() { return AgtEmail; }
    public void setAgtEmail(String agtEmail) { AgtEmail = agtEmail; }

    public String getAgtPosition() { return AgtPosition; }
    public void setAgtPosition(String agtPosition) { AgtPosition = agtPosition; }

    public int getAgencyId() { return AgencyId; }
    public void setAgencyId(int agencyId) { AgencyId = agencyId; }

}
