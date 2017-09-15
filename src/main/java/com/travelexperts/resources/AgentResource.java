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
@Consumes(MediaType.APPLICATION_JSON)
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
    @POST
    public boolean addAgent(Agent agent) {
        return agentService.insertAgent(agent);
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
