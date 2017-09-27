package com.travelexperts.resources;

import com.travelexperts.model.Agent;
import com.travelexperts.services.AgentService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;


/**
 *
 *      Paths:
 *              /agents
 *                     --> returns all agents
 *
 *              /agents/{agentId}
 *                     --> GET: returns one agent
 *                     --> POST:  create a new agent
 *                     --> PUT: replace agent's info
 *                     --> DELETE: remove an agent
 *
 */

@Path("/agents")
@Produces(MediaType.APPLICATION_JSON)
public class AgentResource {

    private AgentService agentService = new AgentService();

    // return list of all agents
    @GET
    public List<Agent> getAgents() {
        return agentService.getAgents();
    }


    // insert an agent and return successs/fail
    // TODO:  check --- does this need to return an agent?

    private int AgentId;
    private String AgtFirstName;
    private String AgtMiddleInitial;
    private String AgtLastName;
    private String AgtBusPhone;
    private String AgtEmail;
    private String AgtPosition;
    private int AgencyId;

    @POST
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    @Produces(MediaType.TEXT_PLAIN)
    public String addAgent(@FormParam("AgtFirstName") String agtFirstName,
                           @FormParam("AgtMiddleInitial") String agtMiddleInitial,
                           @FormParam("AgtLastName") String agtLastName,
                           @FormParam("AgtBusPhone") String agtBusPhone,
                           @FormParam("AgtEmail") String agtEmail,
                           @FormParam("AgtPosition") String agtPosition,
                           @FormParam("AgencyId") int agencyId) {

        // pass a dummy value for agentId - this is auto-assigned
        Agent agt = new Agent(0, agtFirstName, agtMiddleInitial, agtLastName,
                            agtBusPhone, agtEmail, agtPosition, agencyId);

        // try the database query and send back message to user
        if (agentService.insertAgent(agt)) {
            return "Agent insert successful";
        } else {
            return "There was a problem inserting the agent";
        }
    }

    // return a single agent
    @GET
    @Path("/{agentId}")
    public Agent getAgent(@PathParam("agentId") int agentId) {
        return agentService.getAgent(agentId);

    }

    // alter an existing agent record return success/fail
    @PUT
    @Path("/{agentId}")
    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
    public boolean updateAgent(@PathParam("agentId") int agentId, Agent agent) {
        agent.setAgentId(agentId);
        return agentService.updateAgent(agent);
    }

    @DELETE
    @Path("/{agentId}")
    public void deleteAgent(@PathParam("agentId") int agentId) {
        agentService.deleteAgent(agentId);
    }
}
