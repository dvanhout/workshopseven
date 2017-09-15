package com.travelexperts.resources;

import com.travelexperts.model.Agent;
import com.travelexperts.services.AgentService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.ArrayList;


/**
 *
 *      Paths   /agents
 *                     --> returns all agents
 *
 *              /agents/{agentId}
 *                     --> GET: returns one agent
 *                     --> POST:  create a new agent
 *                     --> PUT: replace agent's info
 *                     --> DELETE: remove an agent
 *
 *
 */

@Path("/agents")
@Consumes(MediaType.APPLICATION_JSON)
@Produces(MediaType.APPLICATION_JSON)
public class AgentResource {

    AgentService agentService = new AgentService();

    // return list of all agents
    @GET
    public ArrayList<Agent> getAgents() {
        return agentService.getAgents();
    }


    // return a single agent
    @GET
    @Path("/{agentId}")
    public Agent getAgent(@PathParam("agentId") int agentId) {
        return agentService.getAgent(agentId);
    }
}
